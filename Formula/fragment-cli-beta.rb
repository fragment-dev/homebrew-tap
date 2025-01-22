require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6112.0.0-darwin-x64.tar.gz"
    sha256 "16fa6be719070c631833237850f5f607dba9a00e80f13c023578677456f395d8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6112.0.0-darwin-arm64.tar.gz"
      sha256 "c09a827f5ff453cd979f8d6ee2a8b8647f25f358c26ca2fb5cbf9759a578551c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6112.0.0-linux-x64.tar.gz"
    sha256 "97857691edc9e38cd268d8f8ef8ca883c9489eaad8b0864802b17fe13535f777"
  end
  version "6112.0.0"
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
