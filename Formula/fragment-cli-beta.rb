require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3276.0.0-darwin-x64.tar.gz"
    sha256 "a3110edf4989540c097a3e8d82fca9883e2673f118105d087afe58399ed5883e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3276.0.0-darwin-arm64.tar.gz"
      sha256 "7cd3c2e6b1871693a86515c92f6b1561fdce661e8b776fb40010d6573a4b9246"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3276.0.0-linux-x64.tar.gz"
    sha256 "b26f5f09370d2e2db921a6f468577e3df8bb9a6da341e030e11f9db5d36b2d4a"
  end
  version "3276.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
