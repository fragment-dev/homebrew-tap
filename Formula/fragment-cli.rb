require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.11-1-darwin-x64.tar.gz"
    sha256 "8231234c462098e9feb7412ebda06d72149886679b0773c0c5ac1b9d2883a082"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.11-1-darwin-arm64.tar.gz"
      sha256 "80c0260263d558dc815dda106875e89225ff9b46804aba8f194683b7c0698be3"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.11-1-linux-x64.tar.gz"
    sha256 "d9ce963f1bff7d72c22aa775282fef7ceaeca151f244e4c1b976b664a6edd0fc"
  end
  version "2024.9.11-1"
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
