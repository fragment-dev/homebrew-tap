require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3268.0.0-darwin-x64.tar.gz"
    sha256 "2a91d235170b5e962965cf079cd783f3ba24621e5652cdfb024b123e94215702"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3268.0.0-darwin-arm64.tar.gz"
      sha256 "668f06571628aebe852cc1c13852ded8d92e3ecf0cf210b1f9d2fcfec890b7d9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3268.0.0-linux-x64.tar.gz"
    sha256 "a0ec38227947b8b304ff0f10ddc69cf6a8fc4fc31503b4ebb5840c6c77093bb7"
  end
  version "3268.0.0"
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
