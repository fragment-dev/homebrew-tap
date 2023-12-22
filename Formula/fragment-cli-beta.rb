require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4196.0.0-darwin-x64.tar.gz"
    sha256 "75d8095831fa5978f61315e5fe3461f5f2c40c080e553ebbdc7efd4b63e9ddd6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4196.0.0-darwin-arm64.tar.gz"
      sha256 "eb8ae8624b92ec10f5bcdaedc29fc996d14e70755d2aa530f0f15d2c1d0b5b38"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4196.0.0-linux-x64.tar.gz"
    sha256 "bd6b0316ed04a9bc80808c6904493b3451dbd853c478a608fb4edb59055468a6"
  end
  version "4196.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
