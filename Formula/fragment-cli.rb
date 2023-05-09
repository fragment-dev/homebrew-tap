require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.8-1-darwin-x64.tar.gz"
    sha256 "284290d021fe5ac1a5f116249b50df79643bd718f9d2b3265df2eef96a23b2a0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.8-1-darwin-arm64.tar.gz"
      sha256 "af5c82ceb82161fe4edbb6c97b9ed5a7d67bc42d3c3dfec03a01b1fa88995d57"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.8-1-linux-x64.tar.gz"
    sha256 "ed214760c7a357ab5e4d25306f9620bc3beb2460eb34aa21175a5fd231240c66"
  end
  version "2023.5.8-1"
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
