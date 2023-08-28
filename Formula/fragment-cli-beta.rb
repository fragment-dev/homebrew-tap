require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3408.0.0-darwin-x64.tar.gz"
    sha256 "f506df329ec39476030d78ae4810cfd40aace711ca4f3aea955eca9c1da367cd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3408.0.0-darwin-arm64.tar.gz"
      sha256 "96bc380132cd92aa38b04eb9cd6001f9faea606a57de4715e4bc2b9bee9f1257"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3408.0.0-linux-x64.tar.gz"
    sha256 "00bf541ccadd402eaaa0ba74ade1ab67b70260bea8772aa046b036327aa06bdb"
  end
  version "3408.0.0"
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
