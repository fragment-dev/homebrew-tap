require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4056.0.0-darwin-x64.tar.gz"
    sha256 "72c33f5e09a7672316e506ebedee972307aea5b7ff5c5602f866021fcc198993"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4056.0.0-darwin-arm64.tar.gz"
      sha256 "b17f87d787c1fbb4bad28fa46ebbd2c516c508cb51d40aff037b4f1dcfb80483"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4056.0.0-linux-x64.tar.gz"
    sha256 "12eaee45b5dcbd0b7f8c6ac3c58846a9dc4e5e5f378e75bf706d7b3b20b20ec1"
  end
  version "4056.0.0"
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
