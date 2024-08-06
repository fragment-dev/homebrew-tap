require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5476.0.0-darwin-x64.tar.gz"
    sha256 "19886d705dfe8d6aa9e22632aafe6f33078a3113ae34431d1aa9ce67e7e9993e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5476.0.0-darwin-arm64.tar.gz"
      sha256 "6ff15dc09b47318c5d1339e8e60f70446d9b01fd318019ba07f6694aa3d538ca"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5476.0.0-linux-x64.tar.gz"
    sha256 "784ff51727223e6759d77ece000fb6aacb6f0926b92dc77034e2e6d7e0d735b6"
  end
  version "5476.0.0"
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
