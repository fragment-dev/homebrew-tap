require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4609.0.0-darwin-x64.tar.gz"
    sha256 "2f56003920da31e6331203cba01e1d4865eb82014442cbf623d67d678219eae9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4609.0.0-darwin-arm64.tar.gz"
      sha256 "bcea24aeca58652e76425a092e1fae9bae5fd85d14f024f8e5ae9de2fd9a6277"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4609.0.0-linux-x64.tar.gz"
    sha256 "1d1b36bc87b6c5050ecaafe4961c7e2febdbad4971890758cd29eda5e30ca16a"
  end
  version "4609.0.0"
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
