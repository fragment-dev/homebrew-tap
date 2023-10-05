require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3773.0.0-darwin-x64.tar.gz"
    sha256 "7a5a21c171a7805d9a3fb898c64e40d798444c42d327f4179c0fa05e6bc04f54"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3773.0.0-darwin-arm64.tar.gz"
      sha256 "b2bfc7b1e56e5dcd1641832f1208d5d32829d2dc9dd67203846c08502537f41e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3773.0.0-linux-x64.tar.gz"
    sha256 "ac3ab8539fd0757754e492a6eee501b2037140fa5f7f06e26922e5ea8272ee38"
  end
  version "3773.0.0"
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
