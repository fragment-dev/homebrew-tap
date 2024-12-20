require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5949.0.0-darwin-x64.tar.gz"
    sha256 "729a422e81a4b73a35a2e45e4914fd8c89e48be56da8e44a48c9f353a04959aa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5949.0.0-darwin-arm64.tar.gz"
      sha256 "8b9cfaef94044f0859daf30aace5e85b23e714bb90262b8fdf284e6fb3401b4c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5949.0.0-linux-x64.tar.gz"
    sha256 "8679ed7c9bb6f0437486b4a248fa55c229dd8849ee74c27a94163a2642acee2e"
  end
  version "5949.0.0"
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
