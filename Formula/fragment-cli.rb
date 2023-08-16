require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.16-1-darwin-x64.tar.gz"
    sha256 "e7ee52586fc7856c0a7fc3b3c832065235514842b145cdb2a92ead0600dbfa1a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.16-1-darwin-arm64.tar.gz"
      sha256 "cc783074497471b91e2954eb8dd72dab254465e84dd2b54e58f5ca780f9bb9f1"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.16-1-linux-x64.tar.gz"
    sha256 "8c4a68492f158f50cb1968809f8723307c85d15918131a3be31d7ffb088180bf"
  end
  version "2023.8.16-1"
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
