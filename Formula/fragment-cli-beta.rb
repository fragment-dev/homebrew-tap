require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3730.0.0-darwin-x64.tar.gz"
    sha256 "15fb0a279afa7fb30a93baa4968c316338074b710e9fce96dda9fde7c78f6a38"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3730.0.0-darwin-arm64.tar.gz"
      sha256 "5653537a914bc842419961aec1093d4457cbcc03b6f85fa6d8ddd1d338ad043b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3730.0.0-linux-x64.tar.gz"
    sha256 "992d69f71bcb96c0eb8e906a11ee5390aa1b31b97c0937fe6698e9d0d420fe27"
  end
  version "3730.0.0"
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
