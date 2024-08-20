require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5522.0.0-darwin-x64.tar.gz"
    sha256 "6a3dbde2bbda9a302ae466b03f1f855d98a1274c7c65ef7e0bf2ec2a369e7464"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5522.0.0-darwin-arm64.tar.gz"
      sha256 "e4bcb5fef2a0d38acd63d5716a8aa4dea733888cab0e254f29abc87774d4af26"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5522.0.0-linux-x64.tar.gz"
    sha256 "1dd75691c63e56d2a85047050f761c400a744fb45ac761cab74eea6a00077f92"
  end
  version "5522.0.0"
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
