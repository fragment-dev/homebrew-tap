require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5870.0.0-darwin-x64.tar.gz"
    sha256 "cd68dc86ed87bc89ede7c8e3bbe34deedb442295d0cf19a73820dd1cd7f44e71"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5870.0.0-darwin-arm64.tar.gz"
      sha256 "ce1639554dc42f3f6d9c75984bd62ad0954a3c3d83f8db6ff96c87b2f2b96ff6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5870.0.0-linux-x64.tar.gz"
    sha256 "78412ad95561d65199b9d64c7bf0c0d157701ad16f9bdc2f8acdc4d54f041649"
  end
  version "5870.0.0"
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
