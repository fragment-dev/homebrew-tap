require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4560.0.0-darwin-x64.tar.gz"
    sha256 "9ccd83d65a4ad3e22fb4417f36525c33bf4c948789d2256201bc5fb4eee08c5a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4560.0.0-darwin-arm64.tar.gz"
      sha256 "58e6b56576e41b97f43713ca3cbf497b081418573cf02d34af4f5a02d09c0056"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4560.0.0-linux-x64.tar.gz"
    sha256 "00ccc6c713d75b2fd8e7e9f6c18da7104f6b4da0ab41595a8e20de6d87dbf4dd"
  end
  version "4560.0.0"
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
