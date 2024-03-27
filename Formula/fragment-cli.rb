require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.26-1-darwin-x64.tar.gz"
    sha256 "38d0ec0adf447c94f602ddd64f642bdd574135acb3b4e04e62f87ccdb34a6bed"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.26-1-darwin-arm64.tar.gz"
      sha256 "fe13a3662f69b7202ecd1fd4ba1827bb2197840ad46af2859f4f15c35ced28c4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.26-1-linux-x64.tar.gz"
    sha256 "02be7697733703774f4edbce857d59da5299d346c1574782d6d3e2ec90974f6b"
  end
  version "2024.3.26-1"
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
