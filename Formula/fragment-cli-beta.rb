require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5326.0.0-darwin-x64.tar.gz"
    sha256 "716ebc0b1ca42e971b2b82b76d2ab27e22782f6d19bc1851bdbed49d6df1529c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5326.0.0-darwin-arm64.tar.gz"
      sha256 "5f60c3d27e870f8c0887b5a2235d7e3cc58d5de90d4c5c223c9e8cc2dc9383ce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5326.0.0-linux-x64.tar.gz"
    sha256 "3c9317eea52f3151bc8828123fd7b6ef95bd08e5b670816e32d8cc3b298ef6ef"
  end
  version "5326.0.0"
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
