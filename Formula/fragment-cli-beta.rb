require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4219.0.0-darwin-x64.tar.gz"
    sha256 "61e92fb355ad6164d2a39920883fd34bf0f00ff7414dfe07de1bffca98953c72"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4219.0.0-darwin-arm64.tar.gz"
      sha256 "5b7b3430290acf9b69390f3cd54e627de06504e73f108090474249f23e91c911"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4219.0.0-linux-x64.tar.gz"
    sha256 "ac764342b4c7bbecc43729431686065fbf5e3d869b232ed3961af97f661d8c58"
  end
  version "4219.0.0"
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
