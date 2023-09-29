require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3714.0.0-darwin-x64.tar.gz"
    sha256 "340e49559dbf0ce5cb695d2aa6c579bfd03988550e124ec6154f54958bd62211"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3714.0.0-darwin-arm64.tar.gz"
      sha256 "601dd6510064e57a38f06007a222a3aaf7b8e898bb92456c9e0d929cdce8713d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3714.0.0-linux-x64.tar.gz"
    sha256 "4e137157804a70de20c90aeaea79a4ee2b8f7a2931299737f51015ff1515856d"
  end
  version "3714.0.0"
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
