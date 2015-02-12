<?php namespace Websemantics\SemanticuiTheme;

use Illuminate\Support\ServiceProvider;

/**
 * Class PyrocmsThemeServiceProvider
 *
 * @link          http://anomaly.is/streams-platform
 * @author        AnomalyLabs, Inc. <hello@anomaly.is>
 * @author        Ryan Thompson <ryan@anomaly.is>
 * @package       Websemantics\SemanticuiTheme
 */
class SemanticuiThemeServiceProvider extends ServiceProvider
{

    /**
     * Boot the service provider.
     */
    public function boot()
    {
        app('twig')->addExtension(app('Websemantics\\SemanticuiTheme\\SemanticuiThemePlugin'));
    }

    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        app('events')->listen(
            'Websemantics.Streams.Platform.Ui.Table.Event.*',
            'Websemantics\SemanticuiTheme\Listener\TableListener'
        );
    }
}
 