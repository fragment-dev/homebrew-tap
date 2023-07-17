require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3103.0.0-darwin-x64.tar.gz"
    sha256 "fc7d910620c531590fbffa145aa98974fad80e4af4aa012b2fb4369dbe0ea9b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3103.0.0-darwin-arm64.tar.gz"
      sha256 "a51639efd8d15027eb5f8291046c6aa4d62d1c00e02912f322dd95632f399cb1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3103.0.0-linux-x64.tar.gz"
    sha256 "9f47a53ac15dba68580eae6f04110dc13d95e057c290547f68e7fa82906debd2"
  end
  version "3103.0.0"
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
