require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3973.0.0-darwin-x64.tar.gz"
    sha256 "8660b89dd3b98af4cd592b5a550016159e7e57203ec6df957c7b82c134850967"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3973.0.0-darwin-arm64.tar.gz"
      sha256 "62cec5081bcafd4e4eb84e273c0dda0e54f45d0ec411eb36bcd451fe7fa46d88"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3973.0.0-linux-x64.tar.gz"
    sha256 "de03606c3e8c90472eb8c11c2965a8af1b1e56e87314bfc921feba5a20622299"
  end
  version "3973.0.0"
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
