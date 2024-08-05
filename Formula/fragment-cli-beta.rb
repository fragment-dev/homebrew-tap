require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5472.0.0-darwin-x64.tar.gz"
    sha256 "bab9e7418fbfe74d7af90bfec013d1c7674e3449f7c1fc1c2074344ddef63bbe"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5472.0.0-darwin-arm64.tar.gz"
      sha256 "a5c419170b727c06631ee0c859e9974b453adab263d978265ad4dee30d6f3f6d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5472.0.0-linux-x64.tar.gz"
    sha256 "d61cae5daf153b8d5e3c0e0242559eb178d0131d37c669aabf9307cfb870e757"
  end
  version "5472.0.0"
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
