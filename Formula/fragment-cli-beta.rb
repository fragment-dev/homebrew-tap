require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5569.0.0-darwin-x64.tar.gz"
    sha256 "a91f318d2b062234e1891cabd5fbe8db6ae7a8216821bf0067e5abce8c262105"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5569.0.0-darwin-arm64.tar.gz"
      sha256 "f1aa91e7014605b2b26266b2ccaa5fe2cb6c8dcc3fb18f4877514e1610c42364"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5569.0.0-linux-x64.tar.gz"
    sha256 "d5559e01caa1e1e17f59c449840937d0e21ab7559751a1eff0a5c1d6bf09270a"
  end
  version "5569.0.0"
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
