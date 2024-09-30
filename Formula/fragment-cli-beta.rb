require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5630.0.0-darwin-x64.tar.gz"
    sha256 "44cea8bcce2d65ffedcdc60de82e879a2dda0f403faed9dd64185dd6d634e607"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5630.0.0-darwin-arm64.tar.gz"
      sha256 "90a39f11f6dfa337f78e97045cc4739c7ad8412916875ff6faf895d181742ad7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5630.0.0-linux-x64.tar.gz"
    sha256 "15e3327e6b23bba42d08167d836ad4bed46c5a671d57e68e9fb39b9dbf7ebf4d"
  end
  version "5630.0.0"
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
