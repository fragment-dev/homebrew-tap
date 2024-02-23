require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4628.0.0-darwin-x64.tar.gz"
    sha256 "f8c36a3f84eb8315d44db5bf04714a3b015224fac84992139e409841994c4e53"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4628.0.0-darwin-arm64.tar.gz"
      sha256 "79e0b6a44c94af359967606095d5f84ec7e586acdfda3a74006a0d829c9c0bcc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4628.0.0-linux-x64.tar.gz"
    sha256 "d5f4cc07f57dcfe1e0ec5da17101302fcc9e8e8bca810384ea7830165b529e48"
  end
  version "4628.0.0"
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
