require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5548.0.0-darwin-x64.tar.gz"
    sha256 "dc31da11eb49c5a342dfe3322490d1748f75e970e49557fd3103d92d8545498c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5548.0.0-darwin-arm64.tar.gz"
      sha256 "bb12106a115d100957b742170aa1151af0143cae8fca4ab7c9c36b898d06a397"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5548.0.0-linux-x64.tar.gz"
    sha256 "2a9886493d030b60d8fa71df3f00a8c03e57a463e910ea3a58efdf79ccaa618d"
  end
  version "5548.0.0"
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
