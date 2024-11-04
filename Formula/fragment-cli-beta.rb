require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5727.0.0-darwin-x64.tar.gz"
    sha256 "ba99daf65fce309127eb8504d6faa1a7bafec162f3b2f788e945a2b43236d111"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5727.0.0-darwin-arm64.tar.gz"
      sha256 "94f8f0a41d30d78b5bc10f93ccda156f3d91ee1a206b598bbd879843c2f6a71f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5727.0.0-linux-x64.tar.gz"
    sha256 "1ed70b13310f134080255cb27a550d303778d8b501d76d1c84e9dcc3a84e9543"
  end
  version "5727.0.0"
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
