require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5131.0.0-darwin-x64.tar.gz"
    sha256 "61f0a48afc58ccc2b5ebc8efc0ec17fd7d2b770cc6af11645277d8cee1a6a4a3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5131.0.0-darwin-arm64.tar.gz"
      sha256 "3f8f317a6c36e9a4ebc59c6aa66633a9effb326c201ee727adee12b53ab03bab"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5131.0.0-linux-x64.tar.gz"
    sha256 "9e0b7ca513e540c89bb312eed40294cc1264134f4fbb44d0f2446fa014165b31"
  end
  version "5131.0.0"
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
