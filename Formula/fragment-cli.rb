require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.15-darwin-x64.tar.gz"
    sha256 "fd24862e561a654f57f1c70e187e1096df1957ea108083d515e94d75c1042095"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.15-darwin-arm64.tar.gz"
      sha256 "dde6f7f9a14673d7ea15ccbc52f3cd7e1f7533a1bc1ac15818eb7aed1d48dbbf"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.15-linux-x64.tar.gz"
    sha256 "4b0ece5566d36bed6a0db73279dda526e798c01679e79ba2aeb2e12cd07eafb9"
  end
  version "2025.8.15"
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
