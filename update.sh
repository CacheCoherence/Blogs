#!/usr/bin/env bash
#file: update.sh

if [[ $# -eq 0 ]]
then
    echo "Usage: specify module name(s) to update"
    echo "Available modules are zh and en"
    echo "For example: 'bash update.sh zh en' will update both zh and en"
fi

if [[ $@ =~ zh ]]
then
    echo "Framework update for zh"
    read -p "Update hexo framework and its plugins for zh? Y/N " answer
    if [[ $answer = "Y" ]]
    then
        cd zh
        npm install && npm update && npm audit fix
        git add package.json package-lock.json && git commit -m "Update hexo framework and its plugins for zh"
        cd ..
    fi

    echo "Theme update for zh..."
    read -p "Update landscape theme for zh? Y/N " answer
    if [[ $answer = "Y" ]]
    then
        echo "Which target version should be used?"
        read -p "Please enter a branch or tag name: " version
        git subtree pull --prefix=zh/themes/landscape/ theme-landscape $version --squash -m "Update landscape theme for zh"
    fi

    read -p "Update next theme for zh? Y/N " answer
    if [[ $answer = "Y" ]]
    then
        echo "Which target version should be used?"
        read -p "Please enter a branch or tag name: " version
        git subtree pull --prefix=zh/themes/next/ theme-next $version --squash -m "Update next theme for zh"
    fi

    echo "Plugins update for zh..."
    read -p "Update plugins of next theme for zh? Y/N " answer
    if [[ $answer = "Y" ]]
    then
        git subtree pull --prefix=zh/themes/next/source/lib/reading_progress/ theme-next-reading-progress master --squash -m "Update plugin of next theme for zh"
        git subtree pull --prefix=zh/themes/next/source/lib/bookmark/ theme-next-bookmark master --squash -m "Update plugin of next theme for zh"
        git subtree pull --prefix=zh/themes/next/source/lib/fancybox/ theme-next-fancybox3 master --squash -m "Update plugin of next theme for zh"
        git subtree pull --prefix=zh/themes/next/source/lib/pdf/ theme-next-pdf master --squash -m "Update plugin of next theme for zh"
        git subtree pull --prefix=zh/themes/next/source/lib/jquery_lazyload/ theme-next-jquery-lazyload master --squash -m "Update plugin of next theme for zh"
        git subtree pull --prefix=zh/themes/next/source/lib/fastclick/ theme-next-fastclick master --squash -m "Update plugin of next theme for zh"
        git subtree pull --prefix=zh/themes/next/source/lib/ribbon/ theme-next-ribbon master --squash -m "Update plugin of next theme for zh"
        git subtree pull --prefix=zh/themes/next/source/lib/quicklink/ theme-next-quicklink master --squash -m "Update plugin of next theme for zh"
        git subtree pull --prefix=zh/themes/next/source/lib/Han/ theme-next-han master --squash -m "Update plugin of next theme for zh"
        git subtree pull --prefix=zh/themes/next/source/lib/pangu/ theme-next-pangu master --squash -m "Update plugin of next theme for zh"
    fi
fi

if [[ $@ =~ en ]]
then
    echo "Framework update for en"
    read -p "Update hexo framework and its plugins for en? Y/N " answer
    if [[ $answer = "Y" ]]
    then
        cd en
        npm install && npm update && npm audit fix
        git add package.json package-lock.json && git commit -m "Update hexo framework and its plugins for en"
        cd ..
    fi

    echo "Theme update for en..."
    read -p "Update landscape theme for en? Y/N " answer
    if [[ $answer = "Y" ]]
    then
        echo "Which target version should be used?"
        read -p "Please enter a branch or tag name: " version
        git subtree pull --prefix=en/themes/landscape/ theme-landscape $version --squash -m "Update landscape theme for en"
    fi

    read -p "Update next theme for en? Y/N " answer
    if [[ $answer = "Y" ]]
    then
        echo "Which target version should be used?"
        read -p "Please enter a branch or tag name: " version
        git subtree pull --prefix=en/themes/next/ theme-next $version --squash -m "Update next theme for en"
    fi

    echo "Plugins update for en..."
    read -p "Update plugins of next theme for en? Y/N " answer
    if [[ $answer = "Y" ]]
    then
        git subtree pull --prefix=en/themes/next/source/lib/reading_progress/ theme-next-reading-progress master --squash -m "Update plugin of next theme for en"
        git subtree pull --prefix=en/themes/next/source/lib/bookmark/ theme-next-bookmark master --squash -m "Update plugin of next theme for en"
        git subtree pull --prefix=en/themes/next/source/lib/fancybox/ theme-next-fancybox3 master --squash -m "Update plugin of next theme for en"
        git subtree pull --prefix=en/themes/next/source/lib/pdf/ theme-next-pdf master --squash -m "Update plugin of next theme for en"
        git subtree pull --prefix=en/themes/next/source/lib/jquery_lazyload/ theme-next-jquery-lazyload master --squash -m "Update plugin of next theme for en"
        git subtree pull --prefix=en/themes/next/source/lib/fastclick/ theme-next-fastclick master --squash -m "Update plugin of next theme for en"
        git subtree pull --prefix=en/themes/next/source/lib/ribbon/ theme-next-ribbon master --squash -m "Update plugin of next theme for en"
        git subtree pull --prefix=en/themes/next/source/lib/quicklink/ theme-next-quicklink master --squash -m "Update plugin of next theme for en"
    fi
fi
