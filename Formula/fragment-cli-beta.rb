require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4065.0.0-darwin-x64.tar.gz"
    sha256 "f71d5b2639d980b4c6476ce6905a69b9b4061ef42ed297355637d6d38ac3feb5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4065.0.0-darwin-arm64.tar.gz"
      sha256 "145b433bd3c8a5a4adf2957849a610f8600dfc2a6654041683e2acf2d82b8e9d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4065.0.0-linux-x64.tar.gz"
    sha256 "76f4b7180842951cc896e28af5df7bc48892468eccca4cc5eaa2feb835187f90"
  end
  version "4065.0.0"
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
