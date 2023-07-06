require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3010.0.0-darwin-x64.tar.gz"
    sha256 "47402292046e80bc2dea90ad7a40437c66a03c74305b7da06fc84cfc0514cdd2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3010.0.0-darwin-arm64.tar.gz"
      sha256 "cf757b75e4eab42f6661c27a3e08e414dabc37a17e459ee9acfd8bf177f8aa29"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3010.0.0-linux-x64.tar.gz"
    sha256 "99a3cde3f008d6087a639b2ee86a1c10020d70ff92e1201115b0398fd5541ae9"
  end
  version "3010.0.0"
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
