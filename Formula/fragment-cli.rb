require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.19-darwin-x64.tar.gz"
    sha256 "619ac07f10e5451c4360a9a4273e9429124f2577ebbcd7250bfd8f856095329e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.19-darwin-arm64.tar.gz"
      sha256 "7ed16b91fb5804fbe48cd6c40ea18567118e08137dfa32ef1335be2451a76499"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.19-linux-x64.tar.gz"
    sha256 "ae6c161783e216ab01419a725f6993c28ba657e392e82de4794fb3e698dfa2f7"
  end
  version "2024.8.19"
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
