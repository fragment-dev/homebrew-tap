require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4478.0.0-darwin-x64.tar.gz"
    sha256 "d975cb3bf5ae0a7f5270da76194dc74d1e330ab7478a102a454ce15ed74bb96d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4478.0.0-darwin-arm64.tar.gz"
      sha256 "2574dc88b651d9616eff1160b534a910be8bae34956f45290b5a760b15392b8e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4478.0.0-linux-x64.tar.gz"
    sha256 "c2def07274aae737bb4b95f6019ece89a554b6376dd87e5e7150f73ead2d9233"
  end
  version "4478.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
