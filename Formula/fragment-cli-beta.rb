require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3455.0.0-darwin-x64.tar.gz"
    sha256 "098d46c32366f9ae9609c3968c3bc0cf25c53c1a672fc3f09901aec4e0d58b0c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3455.0.0-darwin-arm64.tar.gz"
      sha256 "45b983eb88308498f57c7c6fc639264aa75122fcdf14658e056a1048110dab41"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3455.0.0-linux-x64.tar.gz"
    sha256 "4cdf618026e80b1ac0148168db0f6e19645f5c23e4b4de4856dfab08757175ca"
  end
  version "3455.0.0"
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
