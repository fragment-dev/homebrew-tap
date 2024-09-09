require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5572.0.0-darwin-x64.tar.gz"
    sha256 "a1cac50074be40b5200ab69521cd38008aa72656de0fa622098ee6e2aabe0bf6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5572.0.0-darwin-arm64.tar.gz"
      sha256 "201dcbc854e7e85987f32b8daefe224f5fa2a863d4964a98c27d200380c854fb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5572.0.0-linux-x64.tar.gz"
    sha256 "a06656606a973ce0c8469ca3723beff48f828ff1fe0a2e164623215fae311c4d"
  end
  version "5572.0.0"
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
