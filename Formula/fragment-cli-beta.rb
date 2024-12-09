require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5862.0.0-darwin-x64.tar.gz"
    sha256 "564a0eda8c506a6e20c3741cad90e87204baebd0ca4082bd8abe10d40b96145c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5862.0.0-darwin-arm64.tar.gz"
      sha256 "8bf0cb017284e2d13d14096fb94e904765c1d42b8da2c124254707a09a9d2dfa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5862.0.0-linux-x64.tar.gz"
    sha256 "6235b7318c7e92333eb2f2ced5ec4e48b37e590df623cbd9d09552c3cec9e9b5"
  end
  version "5862.0.0"
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
