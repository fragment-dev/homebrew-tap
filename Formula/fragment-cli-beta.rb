require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5267.0.0-darwin-x64.tar.gz"
    sha256 "cb50841d75d3a63709cb17b824bcefa56789d5379942ea33c173fc2f4a92faf9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5267.0.0-darwin-arm64.tar.gz"
      sha256 "38efcb000372817f10afbc9061ab473306809552b0d9b53c31fe0e3b333785fa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5267.0.0-linux-x64.tar.gz"
    sha256 "6abbe7004850fb5ef6a89b099faedbee07f1f798b11b074eb50597d02f72f3e2"
  end
  version "5267.0.0"
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
