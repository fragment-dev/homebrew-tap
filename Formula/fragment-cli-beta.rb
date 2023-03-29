require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2297.0.0-darwin-x64.tar.gz"
    sha256 "d329781a83a5b84b7dd9a701ff2416b405d68ba064c167a4b700c1809b43e7fa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2297.0.0-darwin-arm64.tar.gz"
      sha256 "58997724525c1332eea3b35d14b198446c85d118785693a2229a9a68a92eda76"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2297.0.0-linux-x64.tar.gz"
    sha256 "cbd45f84897f8e04e4d406daf6dbcf1686659deebeb3ea5036c1f0e4d3af38d9"
  end
  version "2297.0.0"
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
