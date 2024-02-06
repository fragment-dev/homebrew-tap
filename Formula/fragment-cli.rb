require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.5-2-darwin-x64.tar.gz"
    sha256 "54420ff2fbbf9ddadf6bdd4729abe4487c29823c8717f03989b25c7e994ba46d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.5-2-darwin-arm64.tar.gz"
      sha256 "006548faa046f73fa9dacdea4175bdc98fbff35197be9388ef02808065c3a6f4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.5-2-linux-x64.tar.gz"
    sha256 "a5eb09aaa7129df4c994118ca18c0c419c2802f0406a36730e0dfd6e42a42622"
  end
  version "2024.2.5-2"
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
