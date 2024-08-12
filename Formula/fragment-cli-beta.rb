require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5495.0.0-darwin-x64.tar.gz"
    sha256 "8b93f70721066deb3d5299b9ddbd8827b96fa061d95077c60a00ca0a5e3ac2ea"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5495.0.0-darwin-arm64.tar.gz"
      sha256 "469050b07861c0730a00153fd947bbe7a4b21d4462b580ce5e03e74f750f681a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5495.0.0-linux-x64.tar.gz"
    sha256 "5ce8e8aad243a1e4c8ee23908dbc02dc77381afdaf0c69165c50030361c9b510"
  end
  version "5495.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
