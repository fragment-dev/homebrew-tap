require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2711.0.0-darwin-x64.tar.gz"
    sha256 "1b6e93c4beb8d077c1a39d70e2343cde25061979c373d5d051dfa1b1601c94bd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2711.0.0-darwin-arm64.tar.gz"
      sha256 "121f83d66836233f2bd2b8fb56a5dccff1b0d55f900f299011d347aa7384f323"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2711.0.0-linux-x64.tar.gz"
    sha256 "4927c6d4f20d363b0f2e481616691267f38c3a500ed710bbec6a3bb11974a97a"
  end
  version "2711.0.0"
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
