require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-1-darwin-x64.tar.gz"
    sha256 "436cf13b372cec7b08fb000dc1b52727f8748d0c59ddb1cd013517230924fc66"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-1-darwin-arm64.tar.gz"
      sha256 "6ac983053e0437d4977cc932b45770dcdefa6c88365722a42d2aea01e64eed0e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-1-linux-x64.tar.gz"
    sha256 "853c103982d63356c5830b65525f093fa2ffe57355bae35267efcb95d0cdfb74"
  end
  version "2024.12.24-1"
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
