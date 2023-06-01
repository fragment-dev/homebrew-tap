require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2774.0.0-darwin-x64.tar.gz"
    sha256 "47db120958c884e6e141f5034c7e83c5c43dc77eb66a31cdd7267e6c53113c27"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2774.0.0-darwin-arm64.tar.gz"
      sha256 "bbca3aa92267979b4eac9c7dd0f8b4e0697c2fe34355288a6af45d844ca25683"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2774.0.0-linux-x64.tar.gz"
    sha256 "b0781e21c05d49b3c5a08fdeb33ff63d2b6757f67d9758c956afeff80335c553"
  end
  version "2774.0.0"
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
