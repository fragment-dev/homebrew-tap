require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5273.0.0-darwin-x64.tar.gz"
    sha256 "f98232321ccd6e8f1a7d7a5649a56c3170553e3e113b0f96d5e7f8df536378a5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5273.0.0-darwin-arm64.tar.gz"
      sha256 "a8ae44e4f88645d7df8e93b739a8d17fe2bc42e3a8f8674b0852abbc0efa066a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5273.0.0-linux-x64.tar.gz"
    sha256 "e296248aa488b536f8aaeab3e573f63aa9cb10b099449a03c5559227994860d9"
  end
  version "5273.0.0"
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
