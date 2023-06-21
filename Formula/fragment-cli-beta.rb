require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2891.0.0-darwin-x64.tar.gz"
    sha256 "fab56614b77ecdb05d9f2bdf8efedc8382f075515922db0be6f9b078400ad06f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2891.0.0-darwin-arm64.tar.gz"
      sha256 "14ca7bbfb0b4c7adf7aceb8a816339fd161f288e088831a51383d9d213ecc887"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2891.0.0-linux-x64.tar.gz"
    sha256 "d6a9529c46094289a699d2bf79652b5b3de79ef4d4c532cf07008e2021472a4b"
  end
  version "2891.0.0"
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
