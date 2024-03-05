require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4710.0.0-darwin-x64.tar.gz"
    sha256 "e58afa686f58f7f07f6fb9142d86b052ee195f67fc6ad9881e65b45e9e269df1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4710.0.0-darwin-arm64.tar.gz"
      sha256 "db47c696973b0d99aa83d9bcaac803b20033d8fc2a122281686a14501c4df319"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4710.0.0-linux-x64.tar.gz"
    sha256 "bc12d81b8ea03d9c1822e3b17419a17572a79f2469af72724279f379bedb5efc"
  end
  version "4710.0.0"
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
