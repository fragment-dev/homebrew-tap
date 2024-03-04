require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4699.0.0-darwin-x64.tar.gz"
    sha256 "ab2ee80670dfefad1b31366addca425c02a594aae38a4f617b6bff1a8afcad33"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4699.0.0-darwin-arm64.tar.gz"
      sha256 "dfc0e8fb2f8d5cb86822d39bf7581b1f355f72255923ba4e2d618152dfa515bf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4699.0.0-linux-x64.tar.gz"
    sha256 "ba82efec37b129167425b32ce66999d544bf42e3002597105f2774c0d388cdcd"
  end
  version "4699.0.0"
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
