require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4141.0.0-darwin-x64.tar.gz"
    sha256 "050c90dfdd76ba3d92b1ad12959df227fafdcdaa07e5bdc99cad87711dac6780"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4141.0.0-darwin-arm64.tar.gz"
      sha256 "e5edce8c87e3b3e966940558571ace95a94ae8196495b5a8d69afc4e082a7c98"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4141.0.0-linux-x64.tar.gz"
    sha256 "bb05d5206d4bbbb07dbbadc9b42a9663c5dc24a6c2254b508e4cf96d3e9cd17a"
  end
  version "4141.0.0"
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
