require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3419.0.0-darwin-x64.tar.gz"
    sha256 "9317d9cc61c3bcec4eac90cb658c8366ad45ee0fb9ee2e87d914d5f9f3be3140"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3419.0.0-darwin-arm64.tar.gz"
      sha256 "b94a093dfec08626ddb4cd5e467754b5d2370c25e798481116ef642a3ddb4bfa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3419.0.0-linux-x64.tar.gz"
    sha256 "5a650ba23a158b956d6535ccdfddf233c28049a301977234a3af186fdeed07b7"
  end
  version "3419.0.0"
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
