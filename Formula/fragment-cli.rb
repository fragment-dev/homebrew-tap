require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.28-darwin-x64.tar.gz"
    sha256 "a05b91592514fbb5e397c58525093d54fc229ed4c23655708174534f17b5ca5b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.28-darwin-arm64.tar.gz"
      sha256 "6cd67fe033acbaace410c48cbedede2b272eac293b78bdd2bc61b262466927a4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.28-linux-x64.tar.gz"
    sha256 "ebde0510cc188953ffb28fe6c72010423332231d03f64dbd1952a4cda6d57757"
  end
  version "2024.11.28"
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
