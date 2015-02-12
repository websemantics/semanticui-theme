<?php namespace Websemantics\SemanticuiTheme;

use Anomaly\Streams\Platform\Addon\Plugin\Plugin;

/**
 * Class SemanticuiThemePlugin
 *
 * @link          http://anomaly.is/streams-platform
 * @author        AnomalyLabs, Inc. <hello@anomaly.is>
 * @author        Ryan Thompson <ryan@anomaly.is>
 * @package       Websemantics\SemanticuiTheme
 */
class SemanticuiThemePlugin extends Plugin
{

    /**
     * The plugin functions handler.
     *
     * @var SemanticuiThemePluginFunctions
     */
    protected $functions;

    /**
     * Create a new SemanticuiThemePlugin instance.
     *
     * @param SemanticuiThemePluginFunctions $functions
     */
    public function __construct(SemanticuiThemePluginFunctions $functions)
    {
        $this->functions = $functions;
    }

    /**
     * Return functions to allow interaction
     * with the theme and it's features.
     *
     * @return array
     */
    public function getFunctions()
    {
        return [
            new \Twig_SimpleFunction('theme_nav', [$this->functions, 'nav']),
            new \Twig_SimpleFunction('theme_footprint', [$this->functions, 'footprint']),
            new \Twig_SimpleFunction('theme_pagination', [$this->functions, 'pagination']),
        ];
    }
}
